#echo docker�f�B���N�g���ړ�
#Set-Location ./docker

#echo  svn�̃f�[�^�f�B���N�g�����폜
#Remove-Item -Path volumes/svnedge/csvn/data/* -Recurse -Force

echo  docker起動
docker-compose -f docker-compose.yml -p gitea-server up

exit