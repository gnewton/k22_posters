# GN: remember to:
#   export GS_FONTPATH=/home/gnewton/.local/share/fonts/
#

CWD = $(shell pwd)
XGS_FONTPATH=$CWD

#gsArgs=-dQUIET -dPDFFitPage -dEmbedAllFonts=true -dPDFSETTINGS=/printer -dNOSAFER -dPDFA -dBATCH -dNOPAUSE -dColorConversionStrategy=/LeaveColorUnchanged -dPDFACompatibilityPolicy=2 -sProcessColorModel=DeviceCMYK -sColorConversionStrategy=CMYK -sDEVICE=pdfwrite

gsArgs=-dQUIET -dEmbedAllFonts=true -dPDFSETTINGS=/printer -dNOSAFER  -dBATCH -dNOPAUSE -sProcessColorModel=DeviceCMYK -sColorConversionStrategy=CMYK -sDEVICE=pdfwrite

#gsArgsPNG=-dALLOWPSTRANSPARENCY -dBATCH -dNOPAUSE -dQUIET -dNOSAFER -sDEVICE=png16malpha -dTextAlphaBits=4 -dGraphicsAlphaBits=4 -dDOINTERPOLATE -r700 -dColorImageDownsampleType=/Bicubic -dColorImageResolution=500
gsArgsPNG=-dALLOWPSTRANSPARENCY -dBATCH -dNOPAUSE -dQUIET -dNOSAFER -sDEVICE=png16malpha -dTextAlphaBits=4 -dGraphicsAlphaBits=4 -dDOINTERPOLATE -r800  -dColorImageResolution=800

gsTransp=-dALLOWPSTRANSPARENCY

all: pdfs png pngsmall


pdfs:
	export GS_FONTPATH=$(CWD);gs $(gsArgs) -o pdf/revenge.pdf revenge.ps
	gs $(gsArgs) $(gsTransp) -o pdf/klingon_spaceways_bird.pdf klingon_spaceways_bird.ps
	export GS_FONTPATH=$(CWD);gs $(gsArgs) $(gsTransp) -o pdf/k22-artdeco.pdf k22-artdeco.ps
	gs $(gsArgs) $(gsTransp) -o pdf/klingon_spaceways.pdf klingon_spaceways.ps

png:pdfs
	gs $(gsArgsPNG) -o png/revenge.png  pdf/revenge.pdf
	gs $(gsArgsPNG) -o png/k22-artdeco.png  pdf/k22-artdeco.pdf
	gs $(gsArgsPNG) -o png/klingon_spaceways.png  pdf/klingon_spaceways.pdf
	gs $(gsArgsPNG) -o png/klingon_spaceways_bird.png  pdf/klingon_spaceways_bird.pdf


pngsmall:pdfs
	convert -resize 306x346 png/revenge.png thumbs/revenge_small.png
	convert -resize 306x346 png/k22-artdeco.png thumbs/k22-artdeco_small.png
	convert -resize 346x612 png/klingon_spaceways.png thumbs/klingon_spaceways_small.png
	convert -resize 346x612 png/klingon_spaceways_bird.png thumbs/klingon_spaceways_bird_small.png	

clean:
	-rm pdf/*.pdf png/*.png

klingon_spaceways:
	gs $(gsArgs) $(gsTransp) -o pdf/klingon_spaceways.pdf klingon_spaceways.ps

revenge:
	export GS_FONTPATH=$(CWD);gs $(gsArgs) -o pdf/revenge.pdf revenge.ps

klingon_spaceways_bird:
	gs $(gsArgs) $(gsTransp) -o pdf/klingon_spaceways_bird.pdf klingon_spaceways_bird.ps

k22:
	export GS_FONTPATH=$(CWD);gs $(gsArgs) $(gsTransp) -o pdf/k22-artdeco.pdf k22-artdeco.ps

git:
	git add *.ps Makefile pdf/*.pdf png/*.png thumbs/*.png

