all:

templates:
	(cd tpl/en && temploc2 -output ../tmp/ -macros macros.mtt *.mtt)
	(cd tpl/en && temploc2 -php -output ../tmp/ -macros macros.mtt *.mtt)

deploy_haxe: templates
	haxe project.hxml
	rsync -avz --delete --exclude "www/favicon.ico" --exclude ".htaccess" --exclude "www/file" --exclude "www/_media" --exclude="*.out" --exclude="*.svn" --exclude="*.neko" --exclude="*.php" tpl www ncannasse@haxe.org:/data/haxe

deploy_kaze: templates
	haxe project.hxml
	rsync -avz --delete --exclude "www/favicon.ico" --exclude ".htaccess" --exclude "www/file" --exclude "www/_media" --exclude="*.out" --exclude="*.svn" --exclude="*.neko" --exclude="*.php" tpl www ncannasse@kazegames.com:/data/kaze_www

api:
	haxe project.hxml
	neko apisync.n
