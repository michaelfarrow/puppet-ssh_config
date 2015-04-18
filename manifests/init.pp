class ssh_config {

	$ssh_keys = hiera_hash('accounts::ssh_keys', {})

	if count(keys($ssh_keys)) == 0 {
		$password_auth = 'yes'
	} else {
		$password_auth = 'no'
	}

	class { 'ssh':
		server_options => {
			'PasswordAuthentication' => $password_auth,
			'LoginGraceTime' => 30,
			'Match Group ftpusers' => {
				'ChrootDirectory' => '%h',
				'ForceCommand' => 'internal-sftp',
				'PasswordAuthentication' => 'yes',
				'AllowTcpForwarding' => 'no',
				'X11Forwarding' => 'no',
			},
		},
		client_options => {
			'StrictHostKeyChecking' => 'no', 
			'UserKnownHostsFile' => '/dev/null',
			'LogLevel' => 'QUIET',
		}
	}

}
