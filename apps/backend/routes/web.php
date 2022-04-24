<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function (Request $request) {
    echo 'backend - Top Page';
    echo "<br/>";
    echo "サーバホスト名: " . $request->server('HOSTNAME');
});

Route::get('/backend', function (Request $request) {
    echo 'backend - backend/';
    echo "<br/>";
    echo "サーバホスト名: " . $request->server('HOSTNAME');
});

Route::get('/frontend/specially-path', function (Request $request) {
    echo 'backend - frontend/specially-path';
    echo "<br/>";
    echo "サーバホスト名: " . $request->server('HOSTNAME');
});
