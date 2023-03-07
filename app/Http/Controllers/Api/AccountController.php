<?php

namespace App\Http\Controllers\Api;


use App\Models\Account;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class AccountController extends Controller
{

  /**
   * Display a listing of the resource.
   *
   * @return Response
   */
  public function index()
  {
      $account = Account::get();
      return response()->json($account,200);
  }

  /**
   * Show the form for creating a new resource.
   *
   * @return Response
   */

  public function store(Request $request)
  {
    $rules = [
            'account'=>'required|string',
            'number'=>'required|numeric',
            'beneficiary'=>'required|string',
            'iban'=>'required|string',
            'photo'=>'required|string'
    ] ;

    $validator = Validator::make(request()->all(),$rules);
    if($validator->fails()){
        return response()->json([
            'code' => 422,
            'status' => 0 ,
            'errors' => $validator->errors(),
            'data' => null
        ]);
    }
    $account = Account::create($validator);
    return response()->json($account);

  }

  /**
   * Display the specified resource.
   *
   * @param  int  $id
   * @return Response
   */
  public function show($id)
  {
    $account = Account::findOrFail($id);
    return response()->json($account);

  }

  /**
   * Show the form for editing the specified resource.
   *
   * @param  int  $id
   * @return Response
   */

  public function update($id, Request $request)
  {
    $account = Account::findOrFail($id);

    $validator =$request->validate([
        'account'=>'required|string',
        'number'=>'required|numeric',
        'beneficiary'=>'required|string',
        'iban'=>'required|string',
        'photo'=>'required|string'

    ]);
    if($validator->fails()){
        return response()->json($validator->errors());
    }
    $account->update($validator);
    return response()->json($account);

  }

  /**
   * Remove the specified resource from storage.
   *
   * @param  int  $id
   * @return Response
   */
  public function destroy($id)
  {

    $account = Account::findOrFail($id);
    return response()->json([
        'message'=>'the Account is destroied'
    ]);
  }

}

?>
