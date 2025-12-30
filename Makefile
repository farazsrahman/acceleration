PDF_SOURCE = latex_out/course-notes.pdf
SITE_DIR = /Users/farazrahman/Documents/site/farazsrahman.github.io
PDF_DEST = $(SITE_DIR)/pdfs/accel-opt.pdf

copy:
	@mkdir -p $(dir $(PDF_DEST))
	cp $(PDF_SOURCE) $(PDF_DEST)
	@echo "PDF copied to $(PDF_DEST)"

push: copy
	git commit -am "[update course-notes.pdf] $${MESSAGE}"; \
	git push origin HEAD
	cd $(SITE_DIR) && \
	git add $(PDF_DEST) && \
	git commit -m "[update accel-opt.pdf] $${MESSAGE}" -- $(PDF_DEST) && \
	git push origin HEAD

.PHONY: copy push

