import std.conv : to;
import std.stdio : stderr, writeln;

int
main(string[] args)
{
	int f, i, n;

	if (args.length < 3) {
		stderr.writeln("usage: isfactor.d fac num");
		return 1;
	}

	f = args[1].to!int();
	n = args[2].to!int();

	i = f;
	while (i < n) {
		i += f;
	}

	if (i == n) {
		writeln(f, " is a factor of ", n);
		return 0;
	}

	writeln(f, " is NOT a factor of ", n);
	return 1;
}
