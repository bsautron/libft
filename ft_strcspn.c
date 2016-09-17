#include <libft.h>

size_t	ft_strcspn(const char *s1, const char *s2)
{
	size_t		count;

	count = 0;
	while (*s1)
	{
		if (!ft_strchr(s2, *s1))
			count++;
		else
			break;
		s1++;
	}
	return (count);
}
