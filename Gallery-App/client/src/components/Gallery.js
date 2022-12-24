import React, { useEffect, useState } from 'react';
import sstyles from '../styles/gallery.module.css';
const Imimages = require("../userImages.json");

function Gallery() {

    const [images, setImages] = useState([]);

    useEffect(() => {
        setImages(Imimages);
    },[])

  return (
    <>

      <h1>Photo Gallery</h1>

      {/* the images are currently imported from a json file and are rendered in a unordered list */}
      <ul className={sstyles.listContainer}>
        {images.map((image) => {
          return(
            
            <li className={sstyles.imageContainer}>
              <img className={sstyles.image} src={image.url}/>
            </li>

          )
        })}
      </ul>

    </>
  )
}

export default Gallery