<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Products;
use App\Traits\GeneralTrait;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class CartController extends Controller
{
   use GeneralTrait;
  /**
   * Display a listing of the resource.
   *
   * @return Response
   */
  public function index()
  {

    $cart= Cart::all();
    return $this->returnData('cart',$cart);
  }

  /**
   * Show the form for creating a new resource.
   *
   * @return Response
   */


  public function store(Request $request)
  {
    if(Auth::guard('admin')->check()){
        Cart::instance('cart')->store(Auth::user()->phone);
        return $this->returnSuccessMessage('the cart stored');
    }

  }

  /**
   * Display the specified resource.
   *
   * @param  int  $id
   * @return Response
   */
  public function show($id)
  {
    $cart = Cart::findOrFail($id);
    return $this->returnData('cart',$cart);

  }

  /**
   * Show the form for editing the specified resource.
   *
   * @param  int  $id
   * @return Response
   */

  public function update($id)
  {

  }

  /**
   * Remove the specified resource from storage.
   *
   * @param  int  $id
   * @return Response
   */
  public function destroy($id)
  {
    $cart = Cart::findOrFail($id);
    $cart->delete();
    return $this->returnSuccessMessage('the cart is deleted');

  }
  public function addProduct(Request $request){
    $validator =Validator::make($request->all(),[
        'product_id'=>'required',
        'quantity'=>'required|numeric|min:1'
    ]);
    if($validator->fails()){
        return $this->returnError($validator->errors(),400);
    }
    $product_id = $request->input('product_id');
    $quantity = $request->input('quantity');
    $product = Products::findOrFail($product_id);
    $product->create($request->all());
    return $this->returnData('product',$product,'the cart updated');

  }
  public function checkout(Request $request){
    if(Auth::guard('admin')->check()){
        $user = auth()->user();
        $validator = Validator::make($request->all(),[
            'name'=>'required',
            'phone'=>'required|string|unique:users,phone',
            'district'=>'required|string',
            'city'=>'required'
        ]);
        if($validator->fails()){
            return $this->returnError($validator->errors(),400);
        }
        // count total price
    }
  }

}

?>
