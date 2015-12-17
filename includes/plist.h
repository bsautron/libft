#ifndef LISTING_H
# define LISTING_H

# include <libft.h>

typedef struct s_plist		t_plist;

# define LIST_NEW(X)			((X *)list_new(sizeof(X)))
# define LIST_PUSH_FRONT(X, N)	list_push_front((t_plist **)(X), (t_plist *)(N))
# define LIST_PUSH_BACK(X, N)	list_push_back((t_plist **)(X), (t_plist *)(N))

t_plist			*list_new(size_t size);
void			list_push_front(t_plist **start, t_plist *new);
void			list_push_back(t_plist **start, t_plist *new);

struct		s_plist
{
	void		*next;
};

#endif
