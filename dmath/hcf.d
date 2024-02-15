import std.conv : to;
import std.stdio : write, writeln;

void
main(string[] args)
{
	int i, x, y;
	int[] xf, yf;

	x = args[1].to!int();
	y = args[2].to!int();

	xf = factorsOf(x);
	yf = factorsOf(y);
	for (i = 0; xf.length > i || yf.length > i; i++) {
		if (i < xf.length)
			write(xf[i]);
		write("	");
		if (i < yf.length)
			write(yf[i]);
		writeln();
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
