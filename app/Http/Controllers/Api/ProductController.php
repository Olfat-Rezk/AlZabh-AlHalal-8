<?php

namespace App\Http\Controllers\Api;

use App\Models\Products;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Traits\GeneralTrait;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    use GeneralTrait ;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

     public function __construct()
     {
        $this->middleware('auth:admin')->except('index','show');

     }
    public function index($categories_id)
    {
        $products = Products::where('category_id',$categories_id)
                            ->orderBy('name')
                            ->get();
        return $this->returnData('products',$products,'all products');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try{
            $rules = [
                'name'=>'required|string|min:3',
                'category_id'=>'required|exists:categories,id',
                'photo'=>'string|nullable',
                'price'=>'required|float'
            ];
            $validator = Validator::make($request->all(),$rules);
            $products = Products::create($validator);

            return $this->returnData('products',$products,'product successfully stored' , null);

        } catch(\Exception $e){
            return $this->returnError($e->getCode(),$e->getMessage());

        }


    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        try{
            $products = Products::findOrFail($id);
            return $this->returnData('product',$products,'this is the product');
        }catch(\Exception $e){
            return $this->returnError($e->getCode(),$e->getMessage());

        }
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
        try{
            $products = Products::findOrFail($id);
            $rules = [
                'name'=>'required|string|min:3',
                'category_id'=>'required|exists:categories,id',
                'photo'=>'string|nullable',
                'price'=>'required|float'
            ];
            $validator = Validator::make($request->all(),$rules);
            $products ->update($validator);
            return $this->returnData('',$products,'product successfully stored');

        } catch(\Exception $e){
            return $this->returnError($e->getCode(),$e->getMessage());

        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try{
            $products = Products::findOrFail($id);
            $products->delete();

        }catch(\Exception $e){
            return $this->returnError($e->getCode(),$e->getMessage());

        }
    }
}
