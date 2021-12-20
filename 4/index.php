<?php
$text = 'Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium
    doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis
    et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem,
    quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores
    eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem
    ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius
    modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem.
    Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit
    laboriosam, nisi ut aliquid ex ea commodi consequatur?
    Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium
    doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis
    et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem,
    quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores
    eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem
    ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius
    modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem.
    Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit
    laboriosam, nisi ut aliquid ex ea commodi consequatur?';

function highlightText($src_text, $keywords)
{
    $dst_text = $src_text;
    $keywords = preg_replace_callback('~"[^"]*"~', function ($m) {
        return preg_replace('~\s~', "###", $m[0]);
    }, $keywords);

    $arr = explode(" ", $keywords);
    foreach ($arr as $val) {
        if (strlen($val) > 0) {
            $val = str_replace("###", " ", $val);
            $val = str_replace("\"", "", $val);
            $dst_text = preg_replace("/$val/", "<span style=\"background-color: red;\">$0</span>", $dst_text);
        }
    }
    return $dst_text;
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Форма поиска</title>
</head>

<body>
    <h1>Найти строку в тексте</h1>
    <p>Ключевая строка:</p>
    <form method="post">
        <input name="search" type="text" class="search">
        <input type="submit" name="submit" value="Поиск">
    </form>

    <?php
    if (isset($_POST['submit'])) {
        $text = highlightText($text, $_POST['search']);
    }
    ?>
    <div><?php echo $text; ?></div>
</body>

</html>