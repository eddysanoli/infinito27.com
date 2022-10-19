package ci

import (
	"dagger.io/dagger"

	// Execute commands inside container
	"universe.dagger.io/bash"

	// Manipulate GIT repositories
	"universe.dagger.io/git"
)

// Dagger plan
dagger.#Plan & {

	// Settings to interact with the host machine
	// (Here we tell it to use the local file system)
	client: filesystem: "./": read: {
		contents: dagger.#FS
	}

	// Actions to execute as part of the plan above
	actions: {

		// ---------------------------------------------- //
		// Install node in the container
		install: bash.#Run & {
			script: contents: #"""
					curl -s https://deb.nodesource.com/setup_16.x | sudo bash
					sudo apt install nodejs -y
				"""#
		}

		// ---------------------------------------------- // 
		// Run the test suite inside the docker container
		test: bash.#Run & {
			workdir: "/var/www/infinito27/website/frontend"
			script: contents: "npm run test"
		}

		// ---------------------------------------------- //
		// Build the site
		build: bash.#Run & {
			workdir: "/var/www/infinito27/website/frontend"
			script: contents: "npm run build"
		}
	}

}
