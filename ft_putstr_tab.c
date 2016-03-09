/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putstr_tab.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bsautron <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/05/09 23:50:38 by bsautron          #+#    #+#             */
/*   Updated: 2015/05/09 23:53:10 by bsautron         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libft.h>

void	ft_putstr_tab(char **tab)
{
	int		i;

	i = 0;
	ft_putstr("[");
	while (tab[i])
	{
		ft_putstr("\"");
		ft_putstr(tab[i]);
		ft_putstr("\"");
		i++;
		if (tab[i])
			ft_putstr(", ");
	}
	ft_putstr("]\n");
}
