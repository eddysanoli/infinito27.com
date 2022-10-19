package ci

import (
	"dagger.io/dagger"
	"dagger.io/bash"
	"dagger.io/git"
)

// Dagger plan
dagger.#Plan & {

	client: filesystem: "./": read: {
		contents: dagger.#FS
	}

	actions: {

		// Run the test suite inside the docker container
		test: bash.#Run & {
			workdir: "/var/www/infinito27/website"
			script: contents: "npm run test"
		}
	}

}
