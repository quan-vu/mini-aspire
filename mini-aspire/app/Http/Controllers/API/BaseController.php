<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Response;

class BaseController extends Controller
{
    public function error($error, $code = 404)
    {
        return Response::json([
            'success' => false,
            'message' => $error,
        ], $code);
    }

    public function success($message, $data = NULL, $code = 200)
    {
        return Response::json([
            'success' => true,
            'message' => $message,
            'data' => $data,
        ], $code);
    }
}
