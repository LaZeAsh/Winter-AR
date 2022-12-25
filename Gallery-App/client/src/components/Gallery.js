import React, { useEffect, useState } from 'react';
import sstyles from '../styles/gallery.module.css';
import {storage} from "../firebase/firebase";
import { listAll, ref, getDownloadURL } from 'firebase/storage';

const Imimages = require("../userImages.json");

function Gallery() {
  // ref gets us the reference of the path of the images (which is the root of the bucket in our case)
  const imageListRef = ref(storage, "/");

  const [images, setImages] = useState([]);

  // useEffect(() => {
  //     setImages(Imimages);
  // },[])

  // gets all the items in the bucket using reference declared above, then gets the url for each, finally adds to a state variable
  useEffect(() => {
    console.log("triggered!")
    listAll(imageListRef)
      .then((response) => {
        // console.log(response);
        response.items.forEach(item => {
          // console.log(item);
          getDownloadURL(item).then(url => {
            // this gets the existing values in the imageList and adds the url at the end. Basically an Array.push();
            setImages((prev) => [...prev, url]);
            // console.log(url);
          })
        })
      })
  }, [])

  return (
    <>

      <h1 className={sstyles.title}>Photo Gallery</h1>

      {/* the images are currently imported from a json file and are rendered in a unordered list */}
      <ul className={sstyles.listContainer}>
        {images.map((image) => {
          // console.log(image);
          return(
            
            <li className={sstyles.imageContainer}>
              <img className={sstyles.image} alt={image} src={image}/>
            </li>

          )
        })}

        {/* need to add this last empty li to ensure the last element doesn't stretch */}
        <li className={sstyles.spacerContainer}></li>

      </ul>

    </>
  )
}

export default Gallery