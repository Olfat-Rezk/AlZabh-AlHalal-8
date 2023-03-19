<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Orders;
use App\Traits\GeneralTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    use GeneralTrait;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $order = Orders::all();
        return $this->returnData('order',$order) ;

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rules = [
            'quantity'=>'required|numeric',
            'discount'=>'sometimes',
            'product_id'=>'required|exists:products,id',
            'packing_id'=>'required|exists:packing,id',
            'shredder_id'=>'required|exists:shreeder,id',
            'notes'=>'sometimes'
        ];
        $validator = Validator::make($request->all(),$rules);
        if($validator->fails()){
            return $this->returnError($validator->errors(),400);
        }
        $order = Orders::create($request->all());
        return $this->returnData('order',$order);

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
       $order = Orders::findOrFail($id);
       return $this->returnSuccessMessage('The order is deleted');
    }
}
