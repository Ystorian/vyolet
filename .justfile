set ignore-comments := true
set export := true
set dotenv-load := true


zola_version := `zola --version`
commit_id := `git rev-parse --short HEAD`

# Test site
@check:
	zola --version
	zola check

# Serve for development on http://localhost:1111
@serve:
	lsof -t -c zola | xargs kill
	zola serve --drafts & sleep 1 && \
		open http://localhost:1111

# Kill any running zola process
@kill:
	lsof -t -c zola | xargs kill

# Update the app icons
[macos]
update-appicon:
	themes/vyolet/update-appicon.sh ystorian.svg

# Update Bulma from the upstream repo to the specified version
update-bulma bulma_version:
	# Download the latest version of Bulma.
	curl --location --output bulma.zip \
	https://github.com/jgthms/bulma/releases/download/{{ bulma_version }}/bulma-{{ bulma_version }}.zip
	# Unzip the Bulma files in vendor/bulma.
	unzip -oq bulma.zip -d vendor
	# Delete the zip file.
	rm bulma.zip
	# Delete unneeded files.
	rm -rf vendor/bulma/.[!.]*
	rm vendor/bulma/*.json
	rm vendor/bulma/*.scss
	rm -rf vendor/bulma/css
	rm -rf vendor/bulma/docs
	rm -rf vendor/bulma/test
	rm -rf vendor/bulma/versions

# Update Lucide from the upstream repo to the specified version
update-lucide lucide_version:
	# Download the latest version of Lucide.
	curl --location --output lucide.zip \
	https://github.com/lucide-icons/lucide/archive/refs/tags/{{ lucide_version }}.zip
	# Unzip the Lucide files in vendor/lucide.
	unzip -oq lucide.zip -d vendor
	# Delete the zip file.
	rm lucide.zip
	# Remove the current version.
	rm -rf vendor/lucide
	# Rename the directory.
	mv vendor/lucide-{{ lucide_version }} vendor/lucide
	# Delete unneeded files.
	rm -rf vendor/lucide/.[!.]*
	rm vendor/lucide/*.*
	rm -rf vendor/lucide/categories
	rm -rf vendor/lucide/docs
	rm -rf vendor/lucide/packages
	rm -rf vendor/lucide/scripts
	rm -rf vendor/lucide/tools
	rm vendor/lucide/icons/*.json
