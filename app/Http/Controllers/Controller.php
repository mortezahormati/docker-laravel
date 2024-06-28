<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
/**
 * @OA\Info(title="My First API", version="1.0")
 */
class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    /**
     * @OA\Get(
     *     path="/api/v1/items",
     *     @OA\Response(response="200", description="Display a listing of items")
     * )
     */
    public function index()
    {
        return response()->json(['message' => 'This is a sample response']);
    }
}
