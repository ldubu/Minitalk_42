/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ldubuche <laura.dubuche@gmail.com>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/21 16:12:48 by ldubuche          #+#    #+#             */
/*   Updated: 2022/02/21 16:12:48 by ldubuche         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

int	main(int argc, char **argv)
{
	int	pid;
	if (argc != 3)
	{
		ft_printf("./client [serveur pid] [chaine de charactere]\n");
		return (1);
	}
	if (__isnbr(argv[1]))
		pid = __atoi(argv[1]);
	__send_message(pid, argv[2]);	
	return (0);
}

int	__send_message(int pid, char *message)
{
	while(*message)
	{
		__send_char(pid, *message);
		message++;
	}
	__send_char(*message);
	return (0);
}

int	__send_char(int pid, char c)
{
	
}