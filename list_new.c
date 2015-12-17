#include <plist.h>

t_plist		*list_new(size_t size)
{
	t_plist		*new;

	new = (t_plist *)malloc(size);
	if (new)
		ft_bzero(new, size);
	return (new);
}
