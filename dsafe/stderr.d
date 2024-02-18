/*
 * Opening stderr in safe D
 */

import std.stdio : File;

File
stderr() @safe
{
	return File("/dev/stderr", "w");
}
