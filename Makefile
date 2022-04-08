# GN: remember to:
#   export GS_FONTPATH=/home/gnewton/.local/share/fonts/
#

all: pdfs png pngsmall

pdfs: 
	gs  -dALLOWPSTRANSPARENCY -dNOSAFER -dPDFA -dBATCH -dNOPAUSE -sColorConversionStrategy=UseDeviceIndependentColor -sDEVICE=pdfwrite -dPDFACompatibilityPolicy=2 -sOutputFile=pdf/revenge.pdf revenge.ps
	gs  -dALLOWPSTRANSPARENCY -dNOSAFER -dPDFA -dBATCH -dNOPAUSE -sColorConversionStrategy=UseDeviceIndependentColor -sDEVICE=pdfwrite -dPDFACompatibilityPolicy=2 -sOutputFile=pdf/k22-artdeco.pdf k22-artdeco.ps
	gs -dALLOWPSTRANSPARENCY -dNOSAFER -dPDFA -dBATCH -dNOPAUSE -sColorConversionStrategy=UseDeviceIndependentColor -sDEVICE=pdfwrite -dPDFACompatibilityPolicy=2 -sOutputFile=pdf/klingon_spaceways.pdf klingon_spaceways.ps

png:pdfs
	convert pdf/revenge.pdf -depth 24 png/revenge.png
	convert pdf/k22-artdeco.pdf png/k22-artdeco.png
	convert pdf/klingon_spaceways.pdf png/klingon_spaceways.png

pngsmall:pdfs
	convert -resize 306x346 pdf/revenge.pdf thumbs/revenge_small.png
	convert -resize 306x346 pdf/k22-artdeco.pdf thumbs/k22-artdeco_small.png
	convert -resize 346x612 pdf/klingon_spaceways.pdf thumbs/klingon_spaceways_small.png

clean:
	-rm pdf/*.pdf png/*.png
