
# colima
```shell
% brew install colima
% colima version
colima version 0.5.5
git commit: 6251dc2c2c5d8197c356f0e402ad028945f0e830
```

```shell
% colima start --cpu 4 --memory 4 --disk 100 -a x86_64
```

```shell
% docker context ls
% docker context use colima
```

「https://container-registry.oracle.com/ords/f?p=113:10:119429453176359」にアクセス
ログイン後、「databases」押下
enterpriseリポジトリに対し、「Continue」を押下
oracleのコンテナレジストリにログイン後、プル
```shell
% docker login container-registry.oracle.com
% docker pull container-registry.oracle.com/database/enterprise:19.3.0.0
```

# 参考文献
## 【Docker】Oracleを無料で簡単にローカルに構築する
https://zenn.dev/re24_1986/articles/29430f2f8b4b46
