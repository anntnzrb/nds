# nds
# see license file for copyright and license details

all: options

options:
	@printf 'clean  -- deletes everything for tangling again\n'
	@printf 'tangle -- tangles readme.org to create all needed files\n'
	@printf 'emacs is needed for tangling files\n'

clean:
	@${RM} -r \
		'./lib/' \
		'./arch/' \
		'./void/' \
		'./freebsd/'
	@printf '...the directory has been cleaned\n'

tangle: readme.org
	@emacs --batch --eval "(require 'org)" \
		--eval '(org-babel-tangle-file "$<")' && \
		printf '\n...files were tangled\n'

.PHONY: all options clean tangle
