<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
</head>
<body  >
<div >
    <div class="panel panel-color panel-danger panel-pages panel-shadow">
        <div class="panel-body">
            <form class="form-horizontal m-t-20" method="post" id="loginForm" >
                <div class="form-group">
                    <div class="col-xs-12">
                        <input class=" input-lg input-border" name="username" type="text" required=""
                               placeholder="账号:"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-xs-12">
                        <input class=" input-lg input-border" name="password" type="password" required=""
                               placeholder="密码:"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-xs-12">
                        <div class="checkbox checkbox-danger">
                            <input id="checkbox-signup" name="remeber_me" type="checkbox"/>
                            <label for="checkbox-signup">记住我</label>
                        </div>
                    </div>
                </div>
                <div class="form-group text-center m-t-40">
                    <div class="col-xs-12">
                        <button class="btn btn-danger btn-lg btn-rounded btn-block w-lg waves-effect waves-light" style="box-shadow: 0px 0px 4px #868282;" type="submit">登&nbsp;录
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>