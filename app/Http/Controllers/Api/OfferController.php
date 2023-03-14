<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Offer;
use App\Traits\GeneralTrait;

class OfferController extends Controller
{
    use GeneralTrait;

  /**
   * Display a listing of the resource.
   *
   * @return Response
   */
  public function index()
  {
    try{
        $offers = Offer::all();
    return $this->returnData('offers',$offers);

    }catch(\Exception $e){
        return $this->returnError($e->getCode(),$e->getMessage());

    }


  }

  /**
   * Show the form for creating a new resource.
   *
   * @return Response
   */


  public function store(Request $request)
  {
    try{
        $validated = $request->validate([
            'name'=>'required|string|min:3',
            'percent'=>'required',
            'expirationn_date'=>'nullable|date'
        ]);
        $offer = Offer::create($validated);
        return $this->returnData('offers',$offer);


    }catch(\Exception $e){
       return $this->returnError($e->getCode(),$e->getMessage());

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
    try{
        $offer = Offer::findOrFail($id);
        return $this->returnData('offer', $offer);

    }catch(\Exception $e){
        return $this->returnError($e->getCode(),$e->getMessage());
    }


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
    try{
        $offer = Offer::findOrFail($id);
        $offer->delete();

    }catch(\Exception $e){
        return $this->returnError($e->getCode(),$e->getMessage());


    }

  }

}

?>
