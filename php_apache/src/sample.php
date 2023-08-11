<html>
<head>
    <meta charset="UTF-8">
    <title>Hello</title>
</head>
<body>
<h1><?php print "echoの使い方"; ?></h1>
<h1><?php echo 'echoの使い方'; ?></h1>

<?php
  // 関数を定義
  function echoWithBr($arg) {
    $ret = $arg."<br>";
    echo $ret;
    return $ret;
  }

  $hoges = array('hoge1','hoge2','hoge3');
  foreach($hoges as $hoge) {
    // 関数を呼び出す
    echoWithBr($hoge);
  }
?>

</body>
</html>
