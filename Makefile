bundle/Vundle.vim:
	git clone https://github.com/VundleVim/Vundle.vim.git bundle/Vundle.vim

install: bundle/Vundle.vim

.PHONY: ycm
ycm:
	cd ./bundle/YouCompleteMe && python3 install.py --racer-completer
