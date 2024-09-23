/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ashobajo <ashobajo@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/09/23 11:44:24 by ashobajo          #+#    #+#             */
/*   Updated: 2024/09/23 17:43:02 by ashobajo         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

static void	signal_handler(int signal)
{
	static int	i;
	static char	message;

	i++;
	if (signal == SIGUSR1)
		message = message | 1;
	if (i == 8)
	{
		write(1, &message, 1);
		i = 0;
		message = 0;
	}
	message = message << 1;
}

int	main(void)
{
	int	pid;

	pid = getpid();
	ft_printf(" My server PID is %d\n", pid);
	signal(SIGUSR1, signal_handler);
	signal(SIGUSR2, signal_handler);
	while (1)
	{
		sleep(1);
	}
	return (0);
}
