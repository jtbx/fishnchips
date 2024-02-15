import std.conv : to;
import std.stdio : writeln;

void
main(string[] args)
{
	int x, y;

	x = args[1].to!int();
	y = args[2].to!int();

	foreach (int i; 1 .. 12) {
		writeln(x * i, "	", y * i);
	}
}
