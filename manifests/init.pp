class ssh_config {

	$ssh_keys = hiera_hash('accounts::ssh_keyse', {})

	if count(keys($ssh_keys)) == 0 {
		$password_auth = 'yes'
	} else {
		$password_auth = 'no'
	}

	class { 'ssh':
		server_options => {
			'PasswordAuthentication' => $password_auth,
			'Match Group ftpusers' => {
				'ChrootDirectory' => '%h',
				'ForceCommand' => 'internal-sftp',
				'PasswordAuthentication' => 'yes',
				'AllowTcpForwarding' => 'no',
				'X11Forwarding' => 'no',
			},
		},
	}

}
