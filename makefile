MXMLC = fcsh-wrap
FLIXEL = /Users/philippemongeau/Documents/Flex/Library/flixel
SRC = *.as 
MAIN = MultiplePlanes.as
SWF = Game.swf

$(SWF) : $(SRC)
	$(MXMLC) $(MAIN)  -o $(SWF) -static-link-runtime-shared-libraries=true --source-path=$(FLIXEL)
