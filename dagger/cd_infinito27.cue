package cd

import (
	"dagger.io/dagger"
	"dagger.io/dagger/core"

	// Execute commands inside container
	"universe.dagger.io/bash"

	// Manipulate GIT repositories
	"universe.dagger.io/git"
)

dagger.#Plan & {

	// Settings to interact with the host machine
	// (Here we tell it to use the local file system)
	client: filesystem: "./": read: {
		contents: dagger.#FS
	}

	// Tasks to execute
	actions: {

		// ---------------------------------------------- //
		// Install node in the container
		copy: bash.#Run & {
			script: contents: #"""
                echo hello
				"""#
		}

	}

}
