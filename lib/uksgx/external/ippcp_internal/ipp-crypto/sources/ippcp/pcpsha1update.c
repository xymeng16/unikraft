/*******************************************************************************
* Copyright 2002-2021 Intel Corporation
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*******************************************************************************/

/* 
// 
//  Purpose:
//     Cryptography Primitive.
//     Digesting message according to SHA1
// 
//  Contents:
//        ippsSHA1Update()
//
*/

#include "owndefs.h"
#include "owncp.h"
#include "pcphash.h"
#include "pcphash_rmf.h"
#include "pcptool.h"
#include "pcpsha1stuff.h"

/*F*
//    Name: ippsSHA1Update
//
// Purpose: Updates intermediate digest based on input stream.
//
// Returns:                Reason:
//    ippStsNullPtrErr        pSrc == NULL
//                            pState == NULL
//    ippStsContextMatchErr   pState->idCtx != idCtxSHA1
//    ippStsLengthErr         len <0
//    ippStsNoErr             no errors
//
// Parameters:
//    pSrc        pointer to the input stream
//    len         input stream length
//    pState      pointer to the SHA1 state
//
*F*/
IPPFUN(IppStatus, ippsSHA1Update,(const Ipp8u* pSrc, int len, IppsSHA1State* pState))
{
   /* test state pointer and ID */
   IPP_BAD_PTR1_RET(pState);
   IPP_BADARG_RET(!HASH_VALID_ID(pState, idCtxSHA1), ippStsContextMatchErr);

   /* test input length */
   IPP_BADARG_RET((len<0), ippStsLengthErr);
   /* test source pointer */
   IPP_BADARG_RET((len && !pSrc), ippStsNullPtrErr);

   /*
   // handle non empty message
   */
   if(len) {
      /* select processing function */
      #if (_SHA_NI_ENABLING_==_FEATURE_ON_)
      cpHashProc updateFunc = UpdateSHA1ni;
      #elif (_SHA_NI_ENABLING_==_FEATURE_TICKTOCK_)
      cpHashProc updateFunc = IsFeatureEnabled(ippCPUID_SHA)? UpdateSHA1ni : UpdateSHA1;
      #else
      cpHashProc updateFunc = UpdateSHA1;
      #endif

      int procLen;

      int idx = HAHS_BUFFIDX(pState);
      Ipp8u* pBuffer = HASH_BUFF(pState);
      Ipp64u lenLo = HASH_LENLO(pState) + (Ipp64u)len;

      /* if non empty internal buffer filling */
      if(idx) {
         /* copy from input stream to the internal buffer as match as possible */
         procLen = IPP_MIN(len, (MBS_SHA1-idx));
         CopyBlock(pSrc, pBuffer+idx, procLen);

         /* update message pointer and length */
         idx  += procLen;
         pSrc += procLen;
         len  -= procLen;

         /* update digest if buffer full */
         if( MBS_SHA1 == idx) {
            updateFunc(HASH_VALUE(pState), pBuffer, MBS_SHA1, sha1_cnt);
            idx = 0;
         }
      }

      /* main message part processing */
      procLen = len & ~(MBS_SHA1-1);
      if(procLen) {
         updateFunc(HASH_VALUE(pState), pSrc, procLen, sha1_cnt);
         pSrc += procLen;
         len  -= procLen;
      }

      /* store rest of message into the internal buffer */
      if(len) {
         CopyBlock(pSrc, pBuffer, len);
         idx += len;
      }

      /* update length of processed message */
      HASH_LENLO(pState) = lenLo;
      HAHS_BUFFIDX(pState) = idx;
   }

   return ippStsNoErr;
}
