SRCDIR=	/usr/src

KMOD=	sg
SRCS=	${SRCDIR}/sys/cam/scsi/scsi_sg.c device_if.h bus_if.h
CFLAGS+=	-I${SRCDIR}/sys/cam/scsi -I${SRCDIR}/tools/tools/vhba


device_if.h:
	awk -f ${SRCDIR}/sys/tools/makeobjops.awk  ${SRCDIR}/sys/kern/device_if.m  -h

bus_if.h:
	awk -f ${SRCDIR}/sys/tools/makeobjops.awk  ${SRCDIR}/sys/kern/bus_if.m  -h

.include <bsd.kmod.mk>
