add_cus_dep('pytxcode','pytxmcr',0,'pythontex');
sub pythontex { return system("pythontex \"$_[0]\""); }
