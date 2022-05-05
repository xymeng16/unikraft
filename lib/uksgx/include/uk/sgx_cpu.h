/* SPDX-License-Identifier: BSD-3-Clause */
/*
 * Authors: Xiangyi Meng <xymeng16@gmail.com>
 *
 * Copyright (c) 2022. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

#ifndef _UK_SGX_CPU_H_
#define _UK_SGX_CPU_H_

#include <uk/arch/types.h>

#define	BIT(nr)			        (1UL << (nr))

/* Referred to as IA32_FEATURE_CONTROL in Intel's SDM. */
#define X86_MSR_IA32_FEAT_CTL		            0x0000003a
#define X86_FEAT_CTL_LOCKED				        BIT(0)
#define X86_FEAT_CTL_VMX_ENABLED_INSIDE_SMX		BIT(1)
#define X86_FEAT_CTL_VMX_ENABLED_OUTSIDE_SMX	BIT(2)
#define X86_FEAT_CTL_SGX_LC_ENABLED			    BIT(17)
#define X86_FEAT_CTL_SGX_ENABLED			    BIT(18)
#define X86_FEAT_CTL_LMCE_ENABLED			    BIT(20)

static inline void rdmsr(unsigned int msr, __u32 *lo, __u32 *hi)
{
	asm volatile("rdmsr" : "=a"(*lo), "=d"(*hi)
			     : "c"(msr));
}

static inline __u64 rdmsrl(unsigned int msr)
{
	__u32 lo, hi;

	rdmsr(msr, &lo, &hi);
	return ((__u64) lo | (__u64) hi << 32);
}

#endif