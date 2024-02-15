import std.conv : to;
import std.stdio : write, writeln;

void
main(string[] args)
{
	int min, max;

	min = 1;
	max = 100;

	if (args.length == 2) {
		max = args[1].to!int();
	}
	if (args.length == 3) {
		min = args[1].to!int();
		max = args[2].to!int();
	}

	foreach (int i; min .. max + 1) {
		if (factorsOf(i).length == 2)
			writeln(i);
	}
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
