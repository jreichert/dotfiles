#!/bin/bash

viewer_pdf_supports () {
    case "$1" in
		*.pdf) return 0 ;;
	esac

	return 1
}

viewer_pdf_process () {
    # pdftohtml -i -s -noframes -nodrm -stdout "$1"|lynx -stdin  -force_html -dump "$arg1" && return
    pdftotext -layout -nopgbrk "$1" -
}

BATPIPE_VIEWERS+=('pdf')
