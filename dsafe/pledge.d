/*
 * Snippet of code showing how to call OpenBSD's
 * pledge() syscall in safe D (or not!)
 */

int
main(string[] args) @safe
{
	/* if you're not using @safe you can
	 * remove this ugly lambda thing */
	version (OpenBSD) () @trusted {
		import core.sys.openbsd.unistd : pledge;
		import std.string : toStringz;

		immutable(char) *promises;

		promises = toStringz("stdio rpath wpath cpath ...");
		pledge(promises, null);
	}();
}
