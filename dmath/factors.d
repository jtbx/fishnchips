import std.conv : to;
import std.stdio : stderr, write, writeln;

int
main(string[] args)
{
	int n;

	if (args.length == 1) {
		stderr.writeln("usage: factors.d number");
		return 1;
	}

	n = args[1].to!int();
	foreach (int factor; factorsOf(n)) {
		writeln(factor);
	}

	return 0;
}

int[]
factorsOf(int x)
{
	int[] a;

	foreach (int i; 1 .. x + 1) {
		if (x % i == 0)
			a ~= i;
	}

	return a;
}
