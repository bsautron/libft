#include <plist.h>
#include <stdio.h>

void		list_apply(t_plist *lst, t_plist *(*fn)(t_plist *))
{
	while (lst)
	{
		lst = (*fn)(lst);
		lst = lst->next;
	}
}
