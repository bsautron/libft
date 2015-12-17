#include <plist.h>
#include <stdio.h>

void		list_push_back(t_plist **start, t_plist *new)
{
	t_plist	*tmp;

	if (!start)
		start = &new;
	tmp = *start;
	if (!(*start))
		*start = new;
	else
	{
		while (tmp->next)
			tmp = tmp->next;
		tmp->next = new;
	}
}
