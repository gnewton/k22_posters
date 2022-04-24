# GN: remember to:
#   export GS_FONTPATH=/home/gnewton/.local/share/fonts/
#

gsArgs=-dEmbedAllFonts=true -dPDFSETTINGS=/printer -dNOSAFER -dPDFA -dBATCH -dNOPAUSE -dColorConversionStrategy=/LeaveColorUnchanged -dPDFACompatibilityPolicy=2 -sProcessColorModel=DeviceCMYK -sColorConversionStrategy=CMYK -sDEVICE=pdfwrite

gsTransp=-dALLOWPSTRANSPARENCY

all: pdfs png pngsmall


test:
	gs $(gsArgs) $(gsTransp) -sOutputFile=new.pdf new.ps
#	gs $(gsArgs) $(gsTransp) -sPAPERSIZE=legal -sOutputFile=395x620-British-Airways-as-the-crow-flies-poster_large.pdf 395x620-British-Airways-as-the-crow-flies-poster_large.ps
#	gs $(gsArgs) $(gsTransp) -sPAPERSIZE=legal -sOutputFile=pdf/klingon_spaceways_bird.pdf 395x620-British-Airways-as-the-crow-flies-poster2R.ps
#	gs $(gsArgs) $(gsTransp) -sPAPERSIZE=legal -sOutputFile=crow_outline.pdf crow_outline.ps
#	gs $(gsArgs) $(gsTransp) -sPAPERSIZE=legal -dPSFitPage -sOutputFile=crow_background.pdf crow_background.ps

pdfs:
	gs $(gsArgs) $(gsTransp) -sOutputFile=pdf/klingon_spaceways_bird.pdf klingon_spaceways_bird.ps
	gs $(gsArgs) -sOutputFile=pdf/revenge.pdf revenge.ps
	gs $(gsArgs) -sOutputFile=pdf/k22-artdeco.pdf k22-artdeco.ps
	gs $(gsArgs) $(gsTransp) -sOutputFile=pdf/klingon_spaceways.pdf klingon_spaceways.ps

png:pdfs
	convert pdf/revenge.pdf -depth 24 png/revenge.png
	convert pdf/k22-artdeco.pdf png/k22-artdeco.png
	convert -resize 3460x6120 pdf/klingon_spaceways.pdf png/klingon_spaceways.png
	convert -resize 3460x6120 pdf/klingon_spaceways_bird.pdf png/klingon_spaceways_bird.png	

pngsmall:pdfs
	convert -resize 306x346 pdf/revenge.pdf thumbs/revenge_small.png
	convert -resize 306x346 pdf/k22-artdeco.pdf thumbs/k22-artdeco_small.png
	convert -resize 346x612 pdf/klingon_spaceways.pdf thumbs/klingon_spaceways_small.png
	convert -resize 346x612 pdf/klingon_spaceways_bird.pdf thumbs/klingon_spaceways_bird_small.png	

clean:
	-rm pdf/*.pdf png/*.png
