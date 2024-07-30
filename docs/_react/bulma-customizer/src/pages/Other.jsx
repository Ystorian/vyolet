import VarItem from "../components/VarItem";
import { CSSVAR_KEYS } from "../constants";

import cn from "root/App.module.css";

function Other() {
  const ids = CSSVAR_KEYS.other.map((i) => i.id);

  return (
    <div className={cn.items}>
      {ids.map((id) => {
        return <VarItem key={id} id={id} />;
      })}
    </div>
  );
}

export default Other;
