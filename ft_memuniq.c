/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memuniq.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bsautron <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2014/11/19 04:56:15 by bsautron          #+#    #+#             */
/*   Updated: 2014/11/19 06:37:49 by bsautron         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_memuniq(const void *ptr, size_t len)
{
	size_t			i;
	size_t			cursor;
	unsigned char	buf[256];
	void			*ret;

	i = 0;
	cursor = 0;
	ft_bzero(buf, 256);
	while (i < len)
	{
		if (!ft_memchr(buf, ((unsigned char *)(ptr))[i], 256))
			buf[cursor++] = ((unsigned char *)(ptr))[i];
		i++;
	}
	ret = ft_memalloc(cursor);
	if (ret)
		ret = ft_memcpy(ret, buf, cursor);
	return (ret);
}
