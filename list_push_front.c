#include <plist.h>

void		list_push_front(t_plist **start, t_plist *new)
{
	new->next = *start;
	*start = new;
}
