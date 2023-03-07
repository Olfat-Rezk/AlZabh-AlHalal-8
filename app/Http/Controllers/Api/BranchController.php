<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Branch;
use Illuminate\Support\Facades\Validator;

class BranchController extends Controller
{

  /**
   * Display a listing of the resource.
   *
   * @return Response
   */
  public function index()
  {
    $branches = Branch::paginate(5);
    return response()->json($branches);



  }

  /**
   * Show the form for creating a new resource.
   *
   * @return Response
   */


  public function store(Request $request)
  {

    $rules =[
      'name'=>'require|string',
      'long'=>'nullable|decimal',
      'lat'=>'nullable|decimal'];
      $validator = Validator::make(request()->all,$rules);
      if($validator->fails()){
        return response()->json([
            'code' => 422,
            'status' => 0 ,
            'errors' => $validator->errors(),
            'data' => null
        ]);
      }
      $branches = Branch::create($validator);
      return response()->json($branches);

  }

  /**
   * Display the specified resource.
   *
   * @param  int  $id
   * @return Response
   */
  public function show($id)
  {
    $branches =Branch::findOrFail($id);
    return response()->json($branches);


  }

  /**
   * Show the form for editing the specified resource.
   *
   * @param  int  $id
   * @return Response
   */

  public function update(Request $request ,$id)
  {
    $branches = Branch::findOrFail($id);
    $rules =[
        'name'=>'require|string',
        'long'=>'nullable|decimal',
        'lat'=>'nullable|decimal'];
        $validator = Validator::make(request()->all,$rules);
        if($validator->fails()){
          return response()->json([
              'code' => 422,
              'status' => 0 ,
              'errors' => $validator->errors(),
              'data' => null
          ]);
        }
        $branches = Branch::findOrFail($id);
        $branches->update($validator);
        return response()->json($branches);
  

  }

  /**
   * Remove the specified resource from storage.
   *
   * @param  int  $id
   * @return Response
   */
  public function destroy($id)
  {
    $branches =Branch::findOrFail($id);
    $branches->delete();
    return response()->json($branches);

  }

}

?>
