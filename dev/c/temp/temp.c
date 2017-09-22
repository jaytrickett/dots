#include <stdio.h>

/* print fahrentheit-celsus table
   for fahr = 0, 20, ..., 300 */
main()
{
	float fahr, celsius;
	int lower, upper, step;

	lower = 0;    /* lower limit of temp table */
	upper = 300;    /* upper limit */
	step = 20;    /* step size */

	fahr = lower;

	printf("  ---------- \n");
	printf("  Fahrenheit\n  to Celsius\n  Conversion\n   Table\n  ----------\n");

	while (fahr <= upper) {
		celsius = (5.0/9.0) * (fahr-32.0);
    printf("%3.0f\t%6.1f\n", fahr, celsius);
		fahr = fahr + step;
	}
}
