dnl #
dnl # v5.1-rc2-1115-g5e498abf1485
dnl # dma-buf: explicitely note that dma-fence-chains use 64bit seqno
dnl #
AC_DEFUN([AC_AMDGPU__DMA_FENCE_IS_LATER], [
	AC_KERNEL_DO_BACKGROUND([
		AC_KERNEL_TRY_COMPILE([
			#include <linux/dma-fence.h>
		], [
			const struct dma_fence_ops *ops = NULL;
			__dma_fence_is_later(0, 0, ops);
		], [
			AC_DEFINE(HAVE__DMA_FENCE_IS_LATER_WITH_OPS_ARG, 1,
				[__dma_fence_is_later() is available and has ops arg])
		], [
			dnl #
			dnl # v4.20-rc4-931-gb312d8ca3a7c
			dnl # dma-buf: make fence sequence numbers 64 bit v2
			dnl #
			AC_KERNEL_TRY_COMPILE([
				#include <linux/dma-fence.h>
			], [
				__dma_fence_is_later(0, 0);
			], [
				AC_DEFINE(HAVE__DMA_FENCE_IS_LATER_2ARGS, 1,
					[__dma_fence_is_later() is available and has 2 args])
			])
		])
	])
])

dnl #
dnl # v6.7-rc1-17-g95ba893c9f4f
dnl # dma-buf: fix check in dma_resv_add_fence
dnl #
AC_DEFUN([AC_AMDGPU_DMA_FENCE_IS_LATER_OR_SAME], [
        AC_KERNEL_DO_BACKGROUND([
                AC_KERNEL_TRY_COMPILE([
                        #include <linux/dma-fence.h>
                ], [
                        dma_fence_is_later_or_same(NULL, NULL);
                ], [
                        AC_DEFINE(HAVE_DMA_FENCE_IS_LATER_OR_SAME, 1, [dma_fence_is_later_or_same() is available])
                ])
        ])
])
