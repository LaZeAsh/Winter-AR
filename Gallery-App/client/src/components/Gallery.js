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

      <h1 className={sstyles.title}>Photo Gallery</h1>

      {/* the images are currently imported from a json file and are rendered in a unordered list */}
      <ul className={sstyles.listContainer}>
        {images.map((image) => {
          return(
            
            <li className={sstyles.imageContainer}>
              <img className={sstyles.image} alt={image.url} src={image.url}/>
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